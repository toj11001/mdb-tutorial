// Start mongosh
// mongosh

// Switch to your database
// use mydatabase

// Define the JSON schema
var initial_schema = {
  bsonType: "object",
  required: ["name", "email", "age"],
  properties: {
    name: {
      bsonType: "string",
      description: "must be a string and is required"
    },
    email: {
      bsonType: "string",
      pattern: "^.+@.+\..+$",
      description: "must be a string and match the regular expression pattern"
    },
    age: {
      bsonType: "int",
      minimum: 0,
      description: "must be an integer greater than or equal to 0"
    }
  }
};

// Apply schema validation to the collection
db.runCommand({
  collMod: "reviews_glucose_apart",
  validator: { $jsonSchema: initial_schema },
  validationLevel: "strict",
  validationAction: "error"
});