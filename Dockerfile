#Install the base image. **NOTE** this will only work for i386 images on resin.
FROM resin/i386-debian:latest

#install dependencies for gb the golang builder.
RUN apt-get update -y && apt-get install --no-install-recommends -y -q \
    curl \
    build-essential \
    ca-certificates \
    git \
    mercurial \
    bzr && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

#Install golang 1.4.2 into /go directory.
ENV GOLANG_VERSION 1.4.2
RUN mkdir /goroot && curl https://storage.googleapis.com/golang/go$GOLANG_VERSION.linux-386.tar.gz | tar xvzf - -C /goroot --strip-components=1
RUN mkdir /go

#Add the golang env vars
ENV GOROOT /goroot
ENV GOPATH /go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

#Copy all the code into /go/src/app
COPY . /go/src/app
WORKDIR /go/src/app

#build all the Go source with gb.
RUN go get github.com/constabulary/gb
RUN go install github.com/constabulary/gb/...
RUN gb build all

#tell our container to run the server binary on start.
CMD ["./bin/server"]
