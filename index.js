// Require MySQL for DB
const mysql = require('mysql');
// Require Inquirer for user input
const inquirer = require('inquirer');
// Require console.table for table formatting
const consoleTable = require('console.table');
// Require ascii text generator for welcome message
const ascii_text_generator = require('ascii-text-generator');
// Require chalk for welcome message styling
const chalk = require('chalk');

// Create connection to DB
const connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "eroux13!",
    database: "employees_db"
})

// Start connection
connection.connect((err) => {
    if (err) throw err;
    // Start application
    let welcomeMessage = "CMS TRACKER";
    let ascii_text = ascii_text_generator(welcomeMessage, "2");
    console.log(chalk.blue.bold.bgGreen(ascii_text));
    console.log("\n Welcome to the Employee Content Management System! \n")
    start();
})

const start = () => {
    inquirer
        .prompt({
            name: "menuItem",
            type: "list",
            message: "What would you like to do?",
            choices: [
                "View Employees",
                "View Roles",
                "View Departments",
                "Add Employee",
                "Add Role",
                "Add Department",
                "Update Employee Role",
                "Exit"
            ]
        }).then((answer) => {
            switch (answer.menuItem) {
                case "View Employees":
                    viewEmployees();
                    break;
                case "View Roles":
                    viewRoles();
                    break;
                case "View Departments":
                    viewDepartments();
                    break;
                case "Add Employee":
                    addEmployee();
                    break;
                case "Add Role":
                    addRole();
                    break;
                case "Add Department":
                    addDepartment();
                    break;
                case "Update Employee Role":
                    updateEmployee();
                    break;
                case "Exit":
                    connection.end();
                    break;
                default:
                    console.log(`Invalid Action: ${answer.menuItem}`);
                    break;
            }
        })
}
// Function to view all employees with their respective title, department, salary, and manager if applicable
const viewEmployees = () => {
    // SQL Query
    let query = `SELECT employee.id, employee.first_name, employee.last_name, role.title, department.name, role.salary, CONCAT(manager.first_name, " ", manager.last_name) AS manager 
    FROM employee INNER JOIN role ON employee.role_id = role.id 
    INNER JOIN department ON role.department_id = department.id 
    LEFT JOIN employee AS manager ON employee.manager_id = manager.id 
    ORDER BY ID ASC;`
    connection.query(query, (err, res) => {
        if (err) throw err;
        console.log("\n");
        // Display Results
        console.table(res);
        // Call start() for menu
        start();
    })
}

