//
//  SafeTranslater.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 29/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

class SafeTranslater {
    
    enum SafeTranslaterError: Error {
        
        case accessDenied
        
        case translateFailed
        
        var localizedDescription: String {
            switch self {
            case .accessDenied:
                return "Произошла попытка несанкионированного извлечения ключевой информации"
            case .translateFailed:
                return "Произошла Ошибка сети"
            }
        }
    }
    
    struct yandex_translate_result: Codable {
        let code: Int
        let lang: String
        let text: [String]
    }
    
    static let shared = SafeTranslater()
    
    private init() { }
    
    func safeTranslate(english_text: String, completion: @escaping (Result<String, Error>) -> Void) {
        
        /**************************************************************************************************************/
        /*                                                                                                            */
        /*                                       Код является защищённым                                              */
        /*                                                                                                            */
        /**************************************************************************************************************/
        
        let fdjsgfjgfjdff = "trnsl.1.1.20191103T153017Z."
        let asddsasdsd = "2c0173d7"; let sdssadsdsd = "78327957bb57c7ef"; let sdjflkdjfd = "4a6d935ca21df651"
        let kfjasdjfd = "7c7ef782379557bb"; let jasdlkfjdklf = "044efd0a"; let sadkflddsdkf = "5904e8aa"
        let djsflkdjfjff = "6777778899"; let lskdjafkldfj = "aaaaabbcccc"; let dslkjfdlkfjdf = "eeefgiiklmnooorsz"
        let dsfadfdfdfd = "5012faad4e89c046"; let neussdsk = "5012faad4e89c046";let cxxccxcxcxc = "1651351c"
        let asdkjfkldjfkd = "a55ca2ed"; let dskajfjdf = "8a659044efd0ac12"; let dsafdkfk = "6d5135c2a19df64a"
        @inline(__always) func dfasdfdf(_ block: () -> Bool) -> Bool{ return block() }
        let kasdjfkldfad = "aadd4e89"; let alksdfjkdjf = "46d35ca2"; let jsdfalkjfdjf = "11123345555"
        let skfadfssdad = "c1a944fd0ea50fd0"; let dsdadsadss = "94a55ca214edf651"; let askdlfjldkjf = "5fd0c1a9"
        let sakfdkljfddf = "6d9c35ca"; let enfodena = "9df6a46d5135ca21"; let fdjaslkdjf = "5904e8aac12fd046"
        let cnvnewifds = "ca21a5fd0c1a9a55"; let dfsddffffdfd = "a46d9513"; let vcnxmzvnei = "04f4efd0"
        let ksadlfjskldjfds = "904e8ac1"; let adlksfjdldkf = "4e9c8aac"; let sdsdsdsdasd = "d5f649da2a16135c"
        let xznvcmvncdsd = "2c0173d7"; let dsfdlkfjdkdd = "f6a46d51"; let adjsklfjdsklfjdf = "7c7ef823"
        let dksafjdkjfdksfas = DispatchQueue.global(); let afjskldjfdksjf = NSLock(); var faksdjfkdsajfka = false
        let dsaffdfddf = sdssadsdsd + (Bundle.main.bundleIdentifier ?? dsfdlkfjdkdd) + adlksfjdldkf + cxxccxcxcxc
        let fkdsjgkfjgfg = String(dsaffdfddf.lowercased().replacingOccurrences(of: ".", with: "").sorted())
        if fkdsjgkfjgfg != jsdfalkjfdjf + djsflkdjfjff + lskdjafkldfj + dslkjfdlkfjdf {
        let daksjflksdjfdsk: Result<String, Error> = .failure(SafeTranslaterError.accessDenied)
        completion(daksjflksdjfdsk); return }; guard var faksdjfkajsdkfjadskfjdkf =
        URLComponents(string: "https://translate.yandex.net/api/v1.5/tr.json/translate") else { fatalError() }
        let askjdfdkfjkdf: (Data?, URLResponse?, Error?) -> Void = { dksjfaksdjfdksf, response, error in let daksjflksdjfdsk =
        Result<String, Error> { guard let data = dksjfaksdjfdksf else { throw SafeTranslaterError.translateFailed }
        let dhfsajkdhfakjdsf = try? JSONDecoder().decode(yandex_translate_result.self, from: data)
        if let dksaljfsdkjfd = dhfsajkdhfakjdsf?.text[0] { return dksaljfsdkjfd } else { throw SafeTranslaterError.accessDenied } }
        completion(daksjflksdjfdsk) }; afjskldjfdksjf.lock(); faksdjfkdsajfka = false; afjskldjfdksjf.unlock()
        dksafjdkjfdksfas.asyncAfter(deadline: .now() + 0.01) { afjskldjfdksjf.lock(); faksdjfkdsajfka = true; afjskldjfdksjf.unlock() }
        dksafjdkjfdksfas.async { var fdksjfkajsfksdf = fdjsgfjgfjdff
        if dfasdfdf({afjskldjfdksjf.lock(); let value = faksdjfkdsajfka; afjskldjfdksjf.unlock(); return value}) { fdksjfkajsfksdf += sdssadsdsd
        fdksjfkajsfksdf += "."; if !dfasdfdf({afjskldjfdksjf.lock(); let value = faksdjfkdsajfka
        afjskldjfdksjf.unlock(); return value}) { fdksjfkajsfksdf += sdsdsdsdasd
        var aksdjfdkjfkdfj = dfasdfdf({afjskldjfdksjf.lock(); let value = faksdjfkdsajfka
        afjskldjfdksjf.unlock(); return value}); aksdjfdkjfkdfj.toggle(); if aksdjfdkjfkdfj {
        fdksjfkajsfksdf += skfadfssdad; faksdjfkajsdkfjadskfjdkf.queryItems = [
        URLQueryItem(name: "key", value: dfasdfdf({afjskldjfdksjf.lock(); let value = faksdjfkdsajfka
        afjskldjfdksjf.unlock(); return value}) ? fdksjfkajsfksdf + vcnxmzvnei : fdksjfkajsfksdf + sakfdkljfddf),
        URLQueryItem(name: "lang", value: "en-ru"), URLQueryItem(name: "text", value: english_text)]
        guard let dskjafkldfj = faksdjfkajsdkfjadskfjdkf.url else { fatalError() }; let dskjfalklfjdkf = URLRequest(url: dskjafkldfj)
        let dksjaflkdfjd = URLSession.shared.dataTask(with: dskjfalklfjdkf, completionHandler: askjdfdkfjkdf)
        dksjaflkdfjd.resume() } else { fdksjfkajsfksdf += dsdadsadss; faksdjfkajsdkfjadskfjdkf.queryItems = [
        URLQueryItem(name: "key", value: dfasdfdf({afjskldjfdksjf.lock(); let value = faksdjfkdsajfka
        afjskldjfdksjf.unlock(); return value}) ? fdksjfkajsfksdf + adlksfjdldkf : fdksjfkajsfksdf + sadkflddsdkf),
        URLQueryItem(name: "lang", value: "en-ru"), URLQueryItem(name: "text", value: english_text)]
        guard let dksjaflkdfksdfjadsk = faksdjfkajsdkfjadskfjdkf.url else { fatalError() }
        let ksdjfkldjfdkfj = URLRequest(url: dksjaflkdfksdfjadsk)
        let kdsfjakdfjdfkj = URLSession.shared.dataTask(with: ksdjfkldjfdkfj, completionHandler: askjdfdkfjkdf); kdsfjakdfjdfkj.resume() }
        } else { fdksjfkajsfksdf += dsafdkfk; var dsjdsakfjdlkjfskdjf = dfasdfdf({afjskldjfdksjf.lock(); let value = faksdjfkdsajfka
        afjskldjfdksjf.unlock(); return value}); dsjdsakfjdlkjfskdjf.toggle(); if dsjdsakfjdlkjfskdjf { fdksjfkajsfksdf += dsfadfdfdfd
        faksdjfkajsdkfjadskfjdkf.queryItems = [URLQueryItem(name: "key", value: dfasdfdf({afjskldjfdksjf.lock()
        let value = faksdjfkdsajfka; afjskldjfdksjf.unlock(); return value}) ? fdksjfkajsfksdf + dfsddffffdfd : fdksjfkajsfksdf + xznvcmvncdsd),
        URLQueryItem(name: "lang", value: "en-ru"), URLQueryItem(name: "text", value: english_text)]
        guard let kdjsflakjdfaksdjf = faksdjfkajsdkfjadskfjdkf.url else { fatalError() }
        let kdsjafskdjfsdkjf = URLRequest(url: kdjsflakjdfaksdjf)
        let djfalksdfjasd = URLSession.shared.dataTask(with: kdsjafskdjfsdkjf, completionHandler: askjdfdkfjkdf)
        djfalksdfjasd.resume() } else { fdksjfkajsfksdf += cnvnewifds; faksdjfkajsdkfjadskfjdkf.queryItems = [
        URLQueryItem(name: "key", value: dfasdfdf({afjskldjfdksjf.lock(); let value = faksdjfkdsajfka
        afjskldjfdksjf.unlock(); return value}) ? fdksjfkajsfksdf + cxxccxcxcxc : fdksjfkajsfksdf + dsfdlkfjdkdd),
        URLQueryItem(name: "lang", value: "en-ru"), URLQueryItem(name: "text", value: english_text)]; guard let laksdfjkljdfkladsf =
        faksdjfkajsdkfjadskfjdkf.url else { fatalError() }; let djfaksdjfksljfds = URLRequest(url: laksdfjkljdfkladsf)
        let adsjfkdjfklsdjf = URLSession.shared.dataTask(with: djfaksdjfksljfds, completionHandler: askjdfdkfjkdf)
        adsjfkdjfklsdjf.resume() } } } else { fdksjfkajsfksdf += kfjasdjfd; fdksjfkajsfksdf += "."; if !dfasdfdf({afjskldjfdksjf.lock()
        let value = faksdjfkdsajfka; afjskldjfdksjf.unlock(); return value}) { fdksjfkajsfksdf += enfodena
        var dskajfdkfjdsf = dfasdfdf({afjskldjfdksjf.lock(); let value = faksdjfkdsajfka; afjskldjfdksjf.unlock(); return value})
        dskajfdkfjdsf.toggle(); if dskajfdkfjdsf { fdksjfkajsfksdf += neussdsk; faksdjfkajsdkfjadskfjdkf.queryItems = [
        URLQueryItem(name: "key", value: dfasdfdf({afjskldjfdksjf.lock(); let value = faksdjfkdsajfka
        afjskldjfdksjf.unlock(); return value}) ? fdksjfkajsfksdf + adjsklfjdsklfjdf : fdksjfkajsfksdf + asddsasdsd),
        URLQueryItem(name: "lang", value: "en-ru"), URLQueryItem(name: "text", value: english_text)]
        guard let ksadjfkdfjdksafj = faksdjfkajsdkfjadskfjdkf.url else { fatalError() }
        let ksdjafkdjfdkf = URLRequest(url: ksadjfkdfjdksafj); let djsaflkjfsdkj = URLSession.shared.dataTask(with: ksdjafkdjfdkf,
        completionHandler: askjdfdkfjkdf); djsaflkjfsdkj.resume() } else { faksdjfkajsdkfjadskfjdkf.queryItems = [
        URLQueryItem(name: "key", value: dfasdfdf({afjskldjfdksjf.lock(); let value = faksdjfkdsajfka
        afjskldjfdksjf.unlock(); return value}) ? fdksjfkajsfksdf + kasdjfkldfad : fdksjfkajsfksdf + ksadlfjskldjfds),
        URLQueryItem(name: "lang", value: "en-ru"), URLQueryItem(name: "text", value: english_text)]
        guard let asdjflksjdfalkdsjf = faksdjfkajsdkfjadskfjdkf.url else { fatalError() }; let dkasfjdklfjd = URLRequest(url: asdjflksjdfalkdsjf)
        let ksdajfdkfjdf = URLSession.shared.dataTask(with: dkasfjdklfjd, completionHandler: askjdfdkfjkdf); ksdajfdkfjdf.resume() }
        } else { fdksjfkajsfksdf += sdjflkdjfd; var jdskafjdkfljdfkl = dfasdfdf({afjskldjfdksjf.lock(); let value = faksdjfkdsajfka
        afjskldjfdksjf.unlock(); return value}); jdskafjdkfljdfkl.toggle(); if jdskafjdkfljdfkl { fdksjfkajsfksdf += fdjaslkdjf
        faksdjfkajsdkfjadskfjdkf.queryItems = [
        URLQueryItem(name: "key", value: dfasdfdf({afjskldjfdksjf.lock(); let value = faksdjfkdsajfka
        afjskldjfdksjf.unlock(); return value}) ? fdksjfkajsfksdf + jasdlkfjdklf : fdksjfkajsfksdf + asdkjfkldjfkd),
        URLQueryItem(name: "lang", value: "en-ru"), URLQueryItem(name: "text", value: english_text)]
        guard let url = faksdjfkajsdkfjadskfjdkf.url else { fatalError() }; let jdsaklfjdfkj = URLRequest(url: url)
        let ksadjfkdfjskdfj = URLSession.shared.dataTask(with: jdsaklfjdfkj, completionHandler: askjdfdkfjkdf)
        ksadjfkdfjskdfj.resume() } else { fdksjfkajsfksdf += dskajfjdf; faksdjfkajsdkfjadskfjdkf.queryItems = [
        URLQueryItem(name: "key", value: dfasdfdf({afjskldjfdksjf.lock(); let value = faksdjfkdsajfka
        afjskldjfdksjf.unlock(); return value}) ? fdksjfkajsfksdf + askdlfjldkjf : fdksjfkajsfksdf + alksdfjkdjf),
        URLQueryItem(name: "lang", value: "en-ru"), URLQueryItem(name: "text", value: english_text)]
        guard let dfjsdkjsdfdffd = faksdjfkajsdkfjadskfjdkf.url else { fatalError() }; let jksdhfjakhdsfsdhf = URLRequest(url: dfjsdkjsdfdffd)
        let dsajfdsjfkadsjf = URLSession.shared.dataTask(with: jksdhfjakhdsfsdhf, completionHandler: askjdfdkfjkdf)
        dsajfdsjfkadsjf.resume() } } } }
        
        /**************************************************************************************************************/
    }
    
}
