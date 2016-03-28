import Kitura
import KituraNet
import KituraSys

let router = Router()

    router.get("/") {
        request, response, next in
            response.send("Hello, World!")
            /* response.send("Hello, World!") */
            response.status(HttpStatusCode.OK).send("ouch")
            response.status(HttpStatusCode.OK).send("<p>ouch</p>")
            /* response.status(HttpStatusCode.OK).send("<html><body bgcolor='skyblue'><body></html>") */
            /* response.appendBodyString("<html><body style=\"background: rgb(\(request.urlVariables["red"] ?? "0"), \(request.urlVariables["blue"] ?? "0"), \(request.urlVariables["green"] ?? "0"))\">\n */
            next()
    }

    let server = HttpServer.listen(8092, delegate: router)
Server.run()
