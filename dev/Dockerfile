FROM centos:centos7

RUN yum -y install epel-release

RUN yum update -y && \
    yum -y install git wget curl gcc-c++ make vim && \
    yum -y groupinstall "Development tools"

ENV EDITOR=vim
ENV HOME /root

# golang
WORKDIR /tmp
RUN wget https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf ./go1.10.3.linux-amd64.tar.gz
RUN echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bash_profile
ENV PATH $PATH:/usr/local/go/bin:$HOME/go/bin
# https://github.com/mvdan/sh
RUN go get -u mvdan.cc/sh/cmd/shfmt

# remi-release-7
ADD ./remi.sh /tmp/remi.sh
RUN bash remi.sh

# direnv
WORKDIR $HOME
ADD ./direnv.sh $HOME/direnv.sh
RUN bash direnv.sh

RUN echo eval "$(direnv hook bash)" >> ~/.bashrc

# nginx
RUN yum -y install --enablerepo=remi nginx

# nodejs
RUN curl --silent --location https://rpm.nodesource.com/setup_9.x | bash -

# yarn
RUN curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
RUN yum install -y yarn

# vue.js
WORKDIR /app
RUN cd /app
RUN yarn global add @vue/cli @vue/cli-init

CMD ["nginx", "-g", "daemon off;"]
