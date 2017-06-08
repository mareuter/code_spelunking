 var bob = {
    firstName: "Bob",
    lastName: "Jones",
    phoneNumber: "(650) 777-7777",
    email: "bob.jones@example.com"
};

var mary = {
    firstName: "Mary",
    lastName: "Johnson",
    phoneNumber: "(650) 888-8888",
    email: "mary.johnson@example.com"
};

var contacts = [bob, mary];

function add(firstName, lastName, email, phoneNumber) {
    contacts[contacts.length] = {
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber
    }
}

add("John", "Doe", "john.doe@example.com", "(555) 555-2122");

function printPerson(person) {
    console.log(person.firstName + " " + person.lastName);
}

function list() {
  var contactsLength = contacts.length;
  for (var i = 0; i < contactsLength; i++) {
    printPerson(contacts[i]);
  }
}

list();