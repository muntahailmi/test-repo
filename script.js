var db_name = process.env.MONGO_DBNAME;
var coll_name = process.env.MONGO_COLLECTION;
var org_name = process.env.MONGO_ORGID;
db.getSiblingDB(db_name);
var fetch_data = db[coll_name].find({"org_id": org_name}).toArray();
fetch_data.forEach(entry => {
    fs.writeFile("terraform.tfvars.json", JSON.stringify(entry.vars), err => {
        if (err) {
            console.error("Error writing file: ", err)
        } else {
            console.log("Data exported", JSON.stringify(entry.vars).length)
        }
    })
});
