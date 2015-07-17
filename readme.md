# A Simple Go Seed project for Intel Edison on Resin.io

A the title says this is a starting point for building a [Go][go-link] on the
[Intel Edison][edison-link] using [resin.io][resin-link].

### **Note:** This will only work on Intel Edison. Currently Go cannot build on resin.io ARM images.

The project uses the awesome [GB tool][gb-link] to build and package the project
within the Dockerfile. This way all the dependencies are built along with the source.
To include a dependencies all you need to do is add the source of that dependency
in the `vendor/src` folder and import it in your Go code. In this example we import
`github.com/gorilla/mux`.

The example code itself is very simple and just runs a basic server on port `:8080`.

With this as a starting point you should be able to build a whole myriad of Go powered
IoT devices. Have fun!!

[go-link]:http://golang.org/
[edison-link]:https://www-ssl.intel.com/content/www/us/en/do-it-yourself/edison.html
[resin-link]:https://resin.io/
[gb-link]:https://getgb.io/
