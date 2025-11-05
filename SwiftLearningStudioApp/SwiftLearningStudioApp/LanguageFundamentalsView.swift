//
//  LanguageFundamentalsView.swift
//  SwiftLearningStudioApp
//
//  Created by mohammed Shafiullah on 22/10/25.
//

import SwiftUI
import Combine
import Foundation

struct LanguageFundamentalsView: View {
    //Static Properties
    @State private var usernameForAuthentication = ""
    @State private var passwordForAuthentication = ""

// var: mutable
// let: immutable constant
// Type inference: compiler deduces types
    @State var mutableInt = 1  // 1.inferred as Int
                               //2.@State is used to auto refresh the UI
    
    let pi = 3.55             // inferred as Double
    let name: String? = "Hello"  // inferred as String
    
//**Type alias//
    typealias Age = Int
    var myAge:Age = 25
    func serviceCall(complition : @escaping (Result<String , Error>) -> Void)
    {}
    typealias complitionCanBeWrittenAs = (Result<String , Error>) -> Void
    func serviceCall2(complition :@escaping complitionCanBeWrittenAs)
    {}
//Type alias **//
    
//Force Unwrapping/Value checking AND Safely Unwrapping/Value checking
    func forceUnwrappingFunction()
    {
        let forceUnWrap :String? = "HelloSwift"
// Forcely unwrapping
        let unwrappedName = forceUnWrap!
        print("Hear Im forcefully unwrapping the data::\(unwrappedName)::If the data is nil it will crash the app")
//Safly unwrapping
        if let forceUnWrap2 = forceUnWrap{
            print("Now I'm safly unwrapping the data::\(forceUnWrap2)")
        }
        else{
            print("No data to unwrap ,because it is nil")
        }
//Forcely checking the value
        if forceUnWrap! == "Hellok"{
            print("Hear I'm forcefully matching the data ,if the data is nil it will crash the app")
        }
//Safly checking the value
        if forceUnWrap == "HelloSwift"{
            print("Safly matching the data, even if data is nil it wont crash , it will jump to else case")
        }
        else{
            print("Safly matching the data ,but value is nil")
        }
    }
//Optional Binding example
        func unwrapTheData() -> String {
            var returnValue = ""
            if let wrappedData = name {
                returnValue = wrappedData
            } else {
                print("Not able to wrap the content")
            }
            return returnValue
        }
//Tupple
//Tuple is a lightweight way to group multiple values into a single compound
//Tuple we can save the data without any worrying about it's data type.
//Tuple can retun the values
    func tupleFunction() -> (name:String , age:Int, isactive:Bool)
    {
        let sameDataTypeTuple = ("Name" , "AGE")
        print(sameDataTypeTuple.0)
        let differentDataTypeTuple = ("NAME" ,22 ,true)
        print(differentDataTypeTuple.2)
        let taplewithKeyAndPair = (name:"Ravi" ,age:22 ,isActiveInCalls:true)
        print(taplewithKeyAndPair.age)
        return differentDataTypeTuple
    }
    
// Closures
// Syntax:  {(parameter) -> retunType in }
    //clousers are majorly of 4 Types
    //1.Stright or fully explicit
    //2.Semi explicit
    //3.Type inferred (LHS)
    //4.Fully inferred (shorthand)
    func AllClosureStuff(){
        // lets compare with func for clear understanding
        func add(a:Int , b: Int) -> Int { return a + b}
        //Now closure syntax
//1.Stright or fully explicit
        let add = {(a: Int,b:Int) -> Int in return a + b}
        print("using fully explicit::\(add(10,20))")
//2.Semi explicit
        let add1 = {(a:Int ,b:Int ) -> Int in a + b}
        print(" using semi explicit::\(add1(10,20))")
//3.Type inferred (LHS)
        let add2 :(Int,Int ) -> Int = {(a ,b ) in a + b}
        print("using type inferred:: \(add2(10,20))")
//4.Fully inferred (shorthand)
        let add3 :(Int ,Int) -> Int = {$0 + $1}
        print("using fully inferred:: \(add3(10,20))")
    }
    
//Passing clouser as a funtion parameter
    @State var closureResult = 0
    @State var errorMessage:String? = ""
    @StateObject private var loginVM =  LoginViewModel(authProtocolObj: AuthImplementation())
    func functionWithClosureAsParameter(a:Int , b:Int , clousarCall:(Int ,Int) -> Int ) -> Int
    {
        return clousarCall(a,b)
    }
    
    func reversetheString(){
        let name = "HappyEnding"
        var result = ""
        for i in name {
            result = "\(i)" + result
        }
        print("result :::\(result)")
    }
    
    //Opeque type
    protocol Shape {
        func area() -> Double
    }
    struct Circle: Shape {
        var radius: Double
        func area() -> Double {
            return Double.pi * radius * radius
        }
    }
    // Function returns "some Shape" — caller doesn’t know it’s a Circle
    func makeShape() -> some Shape {
        return Circle(radius: 5)
    }
    
    var body: some View {
        ScrollView{
            ZStack(){
                VStack(alignment: .leading, spacing: 10 ) {
                    //Optional Handling
                    Button("Tap to see Optional Binding in console::")
                    {print("Calling the Optional Binding function::: \(unwrapTheData())")}
                    //Nil-Coalescing
                    Button("Tap to check Nil-Coalescing in console"){
                        let nameis = name ?? "NoData"
                        print("Using Nil-Coalescing::::  \(nameis)")
                    }
                    //mutating variable
                    Button("Tap for mutating variable is updated::"){
                        mutableInt  += 1
                        print(" mutating variable is updatating \(mutableInt)")
                    }
                    //Forcely unwrapping
                    Button("Tap to see Unwrapping types") {
                        forceUnwrappingFunction()
                    }
                    //Tuple
                    Button("Tap to see how tuple works::"){
                        let tupleRetunData = tupleFunction()
                        print(tupleRetunData.age)
                    }
//****Closures
                    Button("All Clouser related tap::\(closureResult)"){
                        AllClosureStuff()
                        //Now 1.Stright or fully explicit
                        let result1 = functionWithClosureAsParameter(a:10 ,b:20 ,clousarCall:{(a:Int ,b:Int) -> Int in return a+b })
                        print("using fully explicit in function Call::\(result1)")
                        //2.Semi explicit
                        let result2 = functionWithClosureAsParameter(a:20,b:30 ,clousarCall:{(a:Int ,b:Int) -> Int in a + b})
                        print("using semi explicit in function call::\(result2)")
                        //3.Type inferred (LHS)
                        let result3 = functionWithClosureAsParameter(a:20 ,b:20 ){(a ,b) in a+b}
                        print("using type inferred in function call::\(result3)")
                        //4.Fully inferred (shorthand)
                        let result4 = functionWithClosureAsParameter(a:10 ,b:40)
                        {$0 + $1}
                        print("using fully inferred in function call::\(result4)")
                    }
                    //Button is also a clouser It inner syntax is init(action:@escaping () -> Void ,lable:() -> Label)
                    //Button have 2 types
                    //1.fully explicit i.e "action + label" both action and label as clousers,
                    //2.simplified “title + action” only action as clouser and tittle
                    
                    //1.fully explicit we see 2 clousers action and label "action + Label"
                    Button(
                        action: { () -> Void in print("Someone tapped me for Explicit clouser")},
                        label: {  Text("Button for Explicit clouser") }
                    )
                    //2.simplified “title + action”
                    Button("Button for semi Explicit clouser" ,action:{print("Someone tapped me for semi Explicit clouser")})
            // ****Tailing clouser
               // what is trailing clouser : Trailing closure is som ethsing that in a dunction if the clouser is the last parameter we can write out of the body ,lets apply for above all clousers
               //1.
                Button(action:{() -> Void in print("Someone tapped me for Label as trailingClouser")})
                { Text("Button for Label as trailingClouser") // 👈 This is the TRAILING CLOSURE
                }// Hear label "Text("I'm the button")" came out of the Button body
               //2.
               Button("Button for action as trailingClouser")
                { print("Someone tapped me for action as trailingClouser") // 👈 This is the TRAILING CLOSURE  // Hear action came out of the Button body
                }
//****Trailing clouser in Networking call real time clouser
                    VStack(spacing:0){
                        Text("hint: Username: Admin , Password: 1234")
                            .foregroundStyle(Color.green.opacity(0.80))
                            .font(.system(size: 13, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack(spacing: 10){
                            TextField("Username", text: $usernameForAuthentication)
                            TextField("Password", text: $passwordForAuthentication)
                            Button("Login Auth"){
                                if let info = loginVM.userdData
                                {
                                    loginVM.textisVisible = true
                                }
                                else {
                                    loginVM.textisVisible = false
                                    loginVM.login(username: usernameForAuthentication, password: passwordForAuthentication)
                                }
                            } .alert(isPresented: $loginVM.showAlert ) {
                                if loginVM.isLoggedIn {
                                    return Alert(title: Text("✅ Success"),message: Text(loginVM.showAlertMessage ?? "Success"),dismissButton: .default(Text("OK") , action: {
                                        loginVM.userdData = nil
                                    }) )}
                                else {
                                    return Alert(title: Text("❌ Failed"),message: Text(loginVM.showAlertMessage ?? "Invalid Credentials"), dismissButton: .default(Text("OK")))}
                            }
                        }  .padding()
                            .background(Color.gray.opacity(0.25)) // light gray background for the HStack
                            .cornerRadius(8)
                           
                        Text(loginVM.showAlertMessage ?? "No data found")
                            .foregroundStyle(Color.green.opacity(0.80))
                            .font(.system(size: 13, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .opacity(loginVM.textisVisible ? 1 : 0)
                    }.padding(.top ,0)
// High order functions
                    Button("Btn High order functions"){
                 //MAP
                 let number = [1,2,3,4]
                 //1.fully explicit
                 let explicitMap = number.map ({(index:Int) -> Int in return index + index })
                 print("explicitMap::\(explicitMap)")
                 //2.Semi explicit
                let semiExplicitMap = number.map ({(index:Int) in index + index })
                 print("semiExplicit::\(semiExplicitMap)")
                //3.Type inferred (LHS)
                 let typeInferredMap = number.map({number in number + number})
                 print("typeInferredMap:::\(typeInferredMap)")
                //4.shorthand
                 let shortHandMap = number.map{$0 + $0}
                 print("shortHandMap:::\(shortHandMap)")
               //Types of Maps
               //1.Compact map
               let compactMapInput = ["1" , "2" , "Three"]
               let resultOfCompactMap = compactMapInput.compactMap{Int($0)}
               //2.Flat map
               let flatMapInput = [[1,2],[3,4] ,[5,6]]
               let flatMapResult = flatMapInput.flatMap{($0)}
               print("flatMapInput::::\(flatMapResult)")
              //3.Filter
               let filterInput = [1,2,3,4,5,6,7,8]
               let filterInputString = ["Anaya" ,"Ananya" ,"Isha" , "Rizwan"]
               let filterEvenOdd = filterInput.filter{$0 % 2 == 0 }
               let filterComparion = filterInput.filter{$0 > 2}
               let filterString = filterInputString.filter{$0.hasPrefix("I")}
               print("filterEvenOdd::::\(filterEvenOdd)")
               print("filterComparion::::\(filterComparion)")
               print("filterInputString::::\(filterString)")
                //Reduce
               let ReduceNumbers = [2,12,15,16,8,10,6,11]
               let reduceSumallValues = ReduceNumbers.reduce(10) { $0 + $1 } // hear always understant value in reduce brackets () is the latest value of $0
               print("reduceSumallValues:::: \(reduceSumallValues)")
               let names = ["Apple", "Google", "Microsoft"]
               let reduceString = names.reduce("Companies: ") { $0 + $1 + " " }
               print(reduceString)
               let reduceAndGetSumOfEvenNumbers = ReduceNumbers.reduce(0){$1 % 2 == 0 ? $0 + $1 : $0}
               print("reduceAndGetSumOfEvenNumbers::::\(reduceAndGetSumOfEvenNumbers)")
              //Examples now using Highorder functions
             //1.Reverse the string "HappyEnding"
             let  name = "HappyEnding"
            let resultReverseClouserWay = name.reduce("") {  String($1) + $0 }
            print(resultReverseClouserWay)
            print(reversetheString())
                    }.padding(.top ,-20)
//Trailing clouser in Networking call real time clouser****//
//Closures*****//
                    Button("Btn Generics,AssosiatedTypes,Opeque Types"){
                        //Calling Generics
                        let IntTypeis = Box(item:10)
                        IntTypeis.result()
                        let StringTypeis = Box(item:"Hello Shafi")
                        StringTypeis.result()
                    //Calling Associatedtypes
                        let IntOfAssosiatedTypeInt = confirmassociatedtypeInt(item:20)
                        IntOfAssosiatedTypeInt.result()
                        let IntOfAssosiatedTypeString = confirmassociatedtypeString(item:"HelloIndia")
                        IntOfAssosiatedTypeString.result()
                        //calling opeque type
                        print("OpequeType:\(makeShape())")
                    }.padding(.top ,-10)
                    
                    Spacer()
                } //VStack
                .padding(20)
            } //ZStack
            .frame(maxWidth: .infinity ,alignment: .leading)
        }
    }
}

//Generics
struct Box<T>
{
    var item:T
    func result (){
        print("What is there in the box::\(item)")
    }
}
//Assosiated Types
protocol Assosi{
    associatedtype myassociatedtype
    var item : myassociatedtype {get}
    func result()
}

struct confirmassociatedtypeInt : Assosi {
    var item: Int
    func result() {
        print("myassociatedtype ::\(item)")
    }
}
struct confirmassociatedtypeString: Assosi {
    var item: String
    func result() {
        print("myassociatedtype ::\(item)")
    }
}



//****Trailing clouser in Networking call real time clouser
struct userInfo {
    var name:String
}
protocol AuthProtocol {
    func getAutuntication (name:String ,password:String , complitionHandler:@escaping((Bool) -> Void))
    func FetchData (loginStatus :Bool,complitionHandler:@escaping(Result<userInfo , Error>) -> Void)
}
class AuthImplementation:AuthProtocol
{
    func getAutuntication(name:String ,password:String, complitionHandler: @escaping (Bool) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2){
             let ResultBool = name == "Admin" && password == "1234"
                complitionHandler(ResultBool)
        }
    }
    func FetchData( loginStatus :Bool,complitionHandler: @escaping (Result<userInfo , Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1){
            let shouldSucceed = loginStatus
            if shouldSucceed {
                let resultData = userInfo(name: "Admin")
                complitionHandler(.success(resultData))
            }
            else{
                var errorDescription: String? { return "Something went wrong" }
                complitionHandler(.failure(errorDescription as! Error))
            }
        }
    }
}
class LoginViewModel :ObservableObject {
    private let authProtocolObjLocal :AuthProtocol
    @Published var userdData: userInfo?
    @Published var isLoggedIn = false
    @Published  var showAlert = false
    @Published var showAlertMessage: String?
    @Published  var textisVisible = false
    
    init(authProtocolObj :AuthProtocol){
        self.authProtocolObjLocal = authProtocolObj
    }
    func login(username: String, password: String) {
        authProtocolObjLocal.getAutuntication(name: username, password: password){ [weak self] responseData in
            DispatchQueue.main.async {
                if responseData {
                    print("Login Success")
                    self?.isLoggedIn = true
                    self?.showAlert = true
                    self?.showAlertMessage = "Login Success"
                    self?.fetchData()
                }
                else{
                    print("Login Failed")
                    self?.showAlertMessage = "Invalid credentials"
                    self?.isLoggedIn = false
                    self?.showAlert = true
                }
            }
        }
    }
    func fetchData(){
        authProtocolObjLocal.FetchData(loginStatus: self.isLoggedIn ){
            [weak self] responseDatais in
            DispatchQueue.main.async{
                switch responseDatais{
                case.success(let userData):
                    self?.userdData = userData
                    self?.textisVisible = true
                    self?.showAlertMessage = "\(String(describing: self?.userdData?.name))"
                case.failure(let error):
                    self?.showAlert = true
                    self?.showAlertMessage = "\(error)"
                }
                }
            }
        }
    }
//****Trailing clouser in Networking call real time clouser
//High order functions
//MAP



#Preview {
    LanguageFundamentalsView()
}
