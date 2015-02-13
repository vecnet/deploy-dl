#
# Modified to just add the key to the vagrant user
# from:
# https://gist.githubusercontent.com/maxim/dafc3b6da5754419babb/raw/7789793ed7e799dc22e6222c30c6130f34a055e7/key_authorization.rb
def authorize_key_for_user(config, *key_paths)
  [*key_paths, nil].each do |key_path|
    if key_path.nil?
      fail "Public key not found at following paths: #{key_paths.join(', ')}"
    end

    full_key_path = File.expand_path(key_path)

    if File.exists?(full_key_path)
      config.vm.provision 'file',
        run: 'once',
        source: full_key_path,
        destination: '/home/vagrant/user_pubkey'

      config.vm.provision 'shell',
        privileged: true,
        run: 'once',
        inline: [
          'echo "Adding user pubkey"',
          'cat /home/vagrant/user_pubkey >> /home/vagrant/.ssh/authorized_keys',
          'rm -f /home/vagrant/user_pubkey',
          'echo "Done!"'].join(" && ")
      break
    end
  end
end
