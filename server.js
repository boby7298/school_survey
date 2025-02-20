const express = require("express");
const mysql = require("mysql");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors());

// MySQL Database Connection
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",  // Set your MySQL password if needed
    database: "school_admission"
});

db.connect(err => {
    if (err) {
        console.error("Database connection failed:", err);
    } else {
        console.log("✅ Connected to MySQL database.");
    }
});

// Create admissions table if not exists
db.query(`
    CREATE TABLE IF NOT EXISTS admissions (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255),
        age INT,
        grade VARCHAR(50),
        parentContact VARCHAR(50),
        reasonForAdmission TEXT
    )
`, (err) => {
    if (err) console.error("❌ Error creating table:", err);
    else console.log("✅ Table 'admissions' is ready.");
});

// 🟢 API: Fetch all admissions
app.get("/admissions", (req, res) => {
    db.query("SELECT * FROM admissions", (err, results) => {
        if (err) {
            console.error("❌ Error fetching data:", err);
            return res.status(500).json({ error: "Database error" });
        }
        res.json(results);
    });
});

// 🟢 API: Submit new admission
app.post("/submit-admission", (req, res) => {
    const { name, age, grade, parentContact, reasonForAdmission } = req.body;

    db.query("INSERT INTO admissions (name, age, grade, parentContact, reasonForAdmission) VALUES (?, ?, ?, ?, ?)", 
    [name, age, grade, parentContact, reasonForAdmission], 
    (err, result) => {
        if (err) {
            console.error("❌ Error inserting data:", err);
            return res.status(500).json({ error: "Failed to save admission" });
        }
        res.json({ message: "✅ Admission saved successfully!" });
    });
});

// 🟠 API: Update admission
app.put("/update-admission/:id", (req, res) => {
    const { id } = req.params;
    const { name, age, grade, parentContact, reasonForAdmission } = req.body;

    db.query("UPDATE admissions SET name=?, age=?, grade=?, parentContact=?, reasonForAdmission=? WHERE id=?", 
    [name, age, grade, parentContact, reasonForAdmission, id], 
    (err, result) => {
        if (err) {
            console.error("❌ Error updating data:", err);
            return res.status(500).json({ error: "Failed to update admission" });
        }
        res.json({ message: "✅ Admission updated successfully!" });
    });
});

// 🔴 API: Delete admission
app.delete("/delete-admission/:id", (req, res) => {
    const { id } = req.params;

    db.query("DELETE FROM admissions WHERE id=?", [id], (err, result) => {
        if (err) {
            console.error("❌ Error deleting data:", err);
            return res.status(500).json({ error: "Failed to delete admission" });
        }
        res.json({ message: "❌ Admission deleted successfully!" });
    });
});

// Start Server on Port 5000
app.listen(5000, () => {
    console.log("🚀 Server running on port 5000");
});
