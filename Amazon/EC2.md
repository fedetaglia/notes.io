# EC2 Instance - Amazon Linux 2

# login as ec2-user
ssh -i ssh -i sentia-staging-instance.pem ec2-user@13.211.24.212

# update yum as requested
sudo yum update

# create deploy user
sudo adduser deploy -m

# add password
passwd deploy
-> generate pw with SecureRandom

# Grant all permissions to deploy user
sudo visudo
deploy ALL=(ALL) NOPASSWD:ALL

# verify password login disabled and allow
vim /etc/ssh/sshd_config
PasswordAuthentication no
AllowUsers deploy

# switch to deploy user and ensure that that user has your SSH key installed
sudo su - deploy
mkdir .ssh
chmod 700 .ssh
touch $HOME/.ssh/authorized_keys
sudo sh -c "chmod 600 ~deploy/.ssh/*"
sudo chown -R deploy: ~deploy/.ssh

# grab public ssh key from local
pbcopy < ~/.ssh/rsa_2.pub

# and paste it into authorized_keys
 vim .ssh/authorized_keys

# logout as ec2 ( we shouldn't need this guy anymore )
exit

# login as deploy
ssh deploy@13.211.24.212

# install git
sudo yum install -y git

# rvm and ruby
sudo yum install -y curl gpg gcc gcc-c++ make
sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | sudo bash -s stable
sudo usermod -a -G rvm `whoami`

if sudo grep -q secure_path /etc/sudoers; then sudo sh -c "echo export rvmsudo_secure_path=1 >> /etc/profile.d/rvm_secure_path.sh" && echo Environment variable installed; fi

# exit and re-login to install ruby
rvm install 2.5.0

# install imagemagic
sudo yum install pecl make ImageMagick ImageMagick-devel php-devel gcc re2c

# install nvm, nodejs, and yarn
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
nvm install node
npm install -g yarn

-- here --
# ngnx
amazon-linux-extras list
sudo amazon-linux-extras install nginx1.12
sudo service nginx restart

