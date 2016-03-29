import Kitura
import KituraNet
import KituraSys
import Foundation
import SwiftyJSON

/* func readText(file_path: String) -> String { */
/*     var str = "" */
/*         if let dir : NSString = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true ).first { */
/*             /* str += dir as String */ */
/*             let path_file_name = dir.stringByAppendingPathComponent( file_path ) */
/*                 do { */
/*                     let text = try NSString( contentsOfFile: path_file_name, encoding: NSUTF8StringEncoding ) */
/*                         str = text as String */
/*                 } catch { */
/*                     //エラー処理 */
/*                     str = "error" */
/*                 } */
/*         } */
/*     return str */
/* } */
/* func writeText(file_path: String, message: String) -> String{ */
/*     let text = message //保存する内容 */
/*         if let dir : NSString = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true ).first { */
/*             let path_file_name = dir.stringByAppendingPathComponent( file_path ) */
/*                 do { */
/*                     try text.writeToFile( path_file_name, atomically: false, encoding: NSUTF8StringEncoding ) */
/*                         return "success\nfile_path: \(path_file_name)\nmessage: \(message)" */
/*                 } catch { */
/*                     return "error" */
/*                 } */
/*         } */
/*     return "Not file_path" */
/* } */

let router = Router()

    router.get("/") {
        request, response, next in
        /*     response.setHeader("Content-Type", value: "text/html; charset=utf-8") */
        /*     do { */
        /*         try response */
        /*             .status(HttpStatusCode.OK)      // ステータスコードを設定します */
        /*             .send("<p>Hello, swift!</p><input type='submit' value='送信'>")   // 文字列を返します */
        /*             .end()                          // レスポンスを終了します */
        /*     } */
        /* catch { */
        /*     // エラー処理 */
        /*     print("Response Error!") */
        /* } */
        /* let file_path = "kitura/data3.txt" */
        /* let message = "ouch3" */
        response.status(HttpStatusCode.OK).send("ouch")
        print("normal")
        /* response.status(HttpStatusCode.OK).send(readText("data.txt")) */
        /* response.status(HttpStatusCode.OK).send(writeText(file_path, message: message)) */
        let entries = [
        ["title":"apple", "content":"swift is a programming language"], 
            ["title":"Ringo Starr", "content":"Ringo Starr is a drummer"], 
        ]
        // JSON形式にエンコードする
        let json = JSON(entries)
        // Content-Type: application/json; charset=utf-8として返す
        try! response.status(HttpStatusCode.OK).sendJson(json).end()
        next()
    }

router.get("/dummy") { request, response, next in
    try! response.redirect("/")
        next()
}
router.get("/example") { request, response, next in
    try! response.redirect("http://example.com/")
        next()
}


    router.get("/swift") { request, response, next in 
        response.status(HttpStatusCode.OK).send("swift, GET!")
        print("get")
            /* response.setHeader("Content-Type", value: "text/html; charset=utf-8") */
            /* do { */
            /*     try response */
            /*         .status(HttpStatusCode.OK)      // ステータスコードを設定します */
            /*         .send("<p>swift, swift!</p><input type='checkbox' name='phone' value='iphone'>")   // 文字列を返します */
            /*         .end()                          // レスポンスを終了します */
            /* } */
    }
    router.post("/swift") { request, response, next in 
        print("post")
        response.status(HttpStatusCode.OK).send("swift, POST!")
    }

    let server = HttpServer.listen(8092, delegate: router)
Server.run()


