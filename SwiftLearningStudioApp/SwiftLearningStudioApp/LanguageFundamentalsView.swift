//
//  LanguageFundamentalsView.swift
//  SwiftLearningStudioApp
//
//  Created by mohammed Shafiullah on 22/10/25.
//

import SwiftUI

struct LanguageFundamentalsView: View {
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
    func fetchData(complition : @escaping (Result<String , Error>) -> Void)
    {}
    typealias complitionCanBeWrittenAs = (Result<String , Error>) -> Void
    func fetchData2(complition :@escaping complitionCanBeWrittenAs)
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
    func functionWithClosureAsParameter(a:Int , b:Int , clousarCall:(Int ,Int) -> Int ) -> Int
    {
        return clousarCall(a,b)
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
                        let result2 = functionWithClosureAsParameter(a:20,b:30 ,clousarCall:{(x:Int ,y:Int) -> Int in x + y})
                        print("using semi explicit in function call::\(result2)")
                        //3.Type inferred (LHS)
                        let result3 = functionWithClosureAsParameter(a:20 ,b:20 ){(x ,y) in x+y}
                        print("using type inferred in function call::\(result3)")
                        //4.Fully inferred (shorthand)
                        let result4 = functionWithClosureAsParameter(a:10 ,b:40)
                        {$0 + $1}
                        print("using fully inferred in function call::\(result4)")
                    }
                    //Closures*****//
                    Spacer()
                }//VStack
                .padding(20)
            }//ZStack
            .frame(maxWidth: .infinity ,alignment: .leading)
        }
    }
}

#Preview {
    LanguageFundamentalsView()
}
