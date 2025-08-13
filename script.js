var db_name = process.env.MONGODB_NAME;
var coll_name = process.env.MONGODB_COLLECTION;
var org_name = process.env.MONGODB_ORGNAME;
db.getSiblingDB(db_name);
var fetch_data = db.coll_name.find({"org_id": org_name}).toArray();
fetch_data.array.forEach(entry => {
    fs.writeFile("terraform.tfvars.json", JSON.stringify(entry.vars), err => {
        if (err) {
            console.error("Error writing file: ", err)
        } else {
            console.log("Data exported")
        }
    })
});
