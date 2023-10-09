//  Personalized ListApp
//  Created by Preity Singh
//last edited 5/1
/*this file has all my code:
 Two different types of structures
 1. View --> content and layout
 2. Preview Provider --> displays what is in view
 In total there are six structures
 1. ContentView
 2. LoginView
 3. SignUpView
 4. toDo: Identifiable
 5. ListView
 6. ContentView_Previews
 */

import SwiftUI

//CONTENT/HOME VIEW --> this is the view of the main welcome screen! it has the app title, login button, and sign up button for new users
//struct --> structure
//this structure defines the content and layout
struct ContentView: View {
    var body: some View { //this line means that everything below is the body of the code and will show in the View
        NavigationStack{ //Navigation Stack is the flow process I used so users can navigate to different screens
            ZStack{ //the ZStack overlays views on top of one another
                //the circles are part of the design of the app; to make it look aesthetic ;)
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack { //VStack = Vertical Stack; it structures the elements in a vertical line
                    HStack { //HStack = Horizontal Stack; it structures the elementals horizontally
                        //title of app
                        Image(systemName: "list.bullet.rectangle.portrait")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Text("Personalized Task List App")
                            .font(.title2)
                    } //end of HStack
                    
                    //I'm using Navigation Link as a button for users to navigate between screens
                    //button to login view screen
                    NavigationLink(destination: LoginView()) {
                        Text("Login") }
                        //!!design of the button
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                    //button to sign up view screen
                    NavigationLink(destination: SignUpView()) { Text("Sign Up!") }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)

                } //end of VStack
            } //end of ZStack
        } //end of NevigationStack
    } //end of body
} //end of ContentView


//LOGIN VIEW --> //after the user clicks the login button on the welcome screen, they go to the login view screen
struct LoginView: View {
   //instance variables
    @State  var password: String = "" //string for password
    @State  var username: String = "" //string for username
    @State  var wrongUsername = 0 //if wrong, var = 2
    @State  var wrongPassword = 0 //if right, var stays 0
    @State  var showingLoginScreen = false //boolean

    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Login") //title page
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername)) //if the user puts in a wrong username, the textfield border will be highlighted red
                    //secure password text field
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongPassword))

                    Button(action: {
                        if username.lowercased() == "preity" && password.lowercased() == "senior" {
                        // if the credentials are correct, go to the main content view
                            showingLoginScreen = true
//NAVIGATION TO LOGIN SCREEN NOT WORKING!
//                            NavigationLink(destination: ListView()) { Text("ListView")}
                        } else {
                        // if the credentials are incorrect, highlight the text fields with a red border
                            wrongUsername = username != "preity" ? 2 : 0
                            wrongPassword = password != "senior" ? 2 : 0
                        } //end of if-else
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    } //end of text-button
//temporary until I figure out how to navigate from login button to List View
                    NavigationLink(destination: ListView()) { Text("List")}
                    
                    NavigationLink(destination: ContentView()) { Text("Back to Welcome Page") }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)

                } //end of VStack
            } //end of ZStack
        } //end of NavigationStack
    } //end of body
    
} //end of LoginView


//SIGN UP VIEW --> //after the user clicks the sign up! button on the welcome screen, they go to the signUpView (for new users)
struct SignUpView: View {
    //instance variables
    @State var password: String = ""
    @State var username: String = ""
    @State var savedUsername = " " //will use these variables to save a username/password combo for long-term user use
    @State var savedPassword = " "
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack {
                    Text("Sign Up") //title
                        .font(.largeTitle)
                        .bold()
                        .padding()
                                        
                    TextField("Username", text: $username) //username textfield
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    Text("You entered: \(username)") //displays what user typed in
                   
                    SecureField("Password", text: $password) //secured password textfield
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    Text("You entered: \(password)") //displays what user typed in to see if they spelt something wrong
                        .padding(.bottom)
                    
    //NEW ADDITIONS- I have to work on the saveUserInfo function
                    Button(action: {
                        saveUserInfo() // save the user info when button is pressed
                    }) {
                        Text("Sign Up")
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)

                    //temporary until I figure out how to navigate from login button to List View
                    NavigationLink(destination: ListView()) { Text("List")}
                    
                    NavigationLink(destination: ContentView()) { Text("Back to Welcome Page") }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)

                } //end of VStack
            } //end of ZStack
        } //end of NavigationStack
        .onAppear(perform: loadUserInfo) // load the user info when view appears
    } //end of body


    func saveUserInfo() {
            savedUsername = username
            savedPassword = password

            let defaults = UserDefaults.standard
            defaults.set(savedUsername, forKey: "savedUsername")
            defaults.set(savedPassword, forKey: "savedPassword")
        } //end of func

        // load user info from UserDefaults
    func loadUserInfo() {
        let defaults = UserDefaults.standard
        if let username = defaults.string(forKey: "savedUsername") {
            savedUsername = username
        }
        if let password = defaults.string(forKey: "savedPassword") {
            savedPassword = password
        }
    } //end of func
       
} //end of SignUpView

//structure list variables
struct toDo: Identifiable {
    var id = UUID() //not in use
    var name: String
    var isCompleted: Bool
    //sorting properties
    var difficulty: Int
    var dueDate: Int
} //end of list variables struct

//LIST VIEW --> self explanatory
struct ListView: View {
    //array
    @State var toDoArray = [
        toDo(name: "20% lab", isCompleted: false, difficulty: 1, dueDate: 2),
        toDo(name: "ready ch. 20", isCompleted: false, difficulty: 0, dueDate: 1),
        toDo(name: "english project draft", isCompleted: false, difficulty: 0, dueDate: 3),
        toDo(name: "study for econ test", isCompleted: false, difficulty: 1, dueDate: 1)
    ]
    
    var body: some View {
        VStack{
            Text("Today's To-Do List!").font(.headline)
           
            //adding the List of items to the View
            List {
                ForEach(toDoArray) { item in
                    Text(item.name)
                }
                .onDelete(perform: deleteItem) //calling the delete function
            }
                        
            HStack{
                //if clicked, calls on addItem function
                Button("Add Item") {
                    let difficulty = toDoArray.count + 1 //assign next available priority number
                    let dueDate = 1 //WORK ON this line
                    addItem(name: "New To-Do", difficulty: difficulty, dueDate: dueDate)
                }
                //if clicked, calls on sortItems function
                Button("Sort Items") {
                    sortItems()
                }
            } //end of HStack
        } //end of VStack
    } //end of body

//adding a new list item function
    func addItem(name: String, difficulty: Int, dueDate: Int) {
        let newTask = toDo(name: name, isCompleted: false, difficulty: difficulty, dueDate: dueDate)
        toDoArray.append(newTask)
    } //end of function
    
//swipe to delete task function
    func deleteItem(at offsets: IndexSet) {
        toDoArray.remove(atOffsets: offsets)
    } //end of func
        

//sort/personalize list function
    func sortItems() {
        toDoArray.sort { (first, second) in
            if first.difficulty != second.difficulty {
                return first.difficulty > second.difficulty // sort by priority
            } else {
                return first.dueDate < second.dueDate // sort by due date
            }
        }
    } //end of func
    
} //end of ListView

//this structure declares a preview for the content view structure above
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
