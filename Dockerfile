FROM centos:7
MAINTAINER hehr <mingguohu@foxmail.com>
RUN yum install -y readline-devel \
									 vim-enhanced \
									 git \
                   pcre-devel \
				           openssl-devel \
								   gcc \
								   make \
								   perl \
								   wget \
								   && wget https://openresty.org/download/openresty-1.11.2.1.tar.gz \
								   && tar zxvf openresty-1.11.2.1.tar.gz \
								   && cd openresty-1.11.2.1/ \
								   && ./configure --with-http_realip_module \
								   && make \
								   && make install \
								   && cd \
								   && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
								   && rm -fr /openresty-1.11.2.1/ \
								   && rm /openresty-1.11.2.1.tar.gz
#CMD ["/usr/local/openresty/nginx/sbin/nginx", "-g", "daemon off;"]
ENV  PATH  $PATH:/usr/local/openresty/nginx/sbin
