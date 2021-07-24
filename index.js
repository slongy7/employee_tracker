const mysql = require('mysql');
const inquirer = require('inquirer');
require('console.table');




function prompt() {
    inquirer.prompt({
        name: 'action',
        type: 'list',
        message: 'What would you like to do?',
        choices: [
            promptMessages.viewAllEmployees,
            promptMessages.viewByDepartment,
            promptMessages.viewByManager,
            promptMessages.viewAllRoles,
            promptMessages.addEmployee,
            promptMessages.removeEmployee,
            promptMessages.updateRole,
            promptMessages.exit
        ]

    })
    .then(answer => {
        console.log('answer', answer);
        switch (answer.action) {
            case promptMessages.viewAllEmployees:
                viewAllEmployees();
                break;

            case promptMessages.viewByDepartment:
                viewByDepartment();
                break;  
                
            case promptMessages.viewByManager:
                viewByManager();
                break;
                    
            case promptMessages.addEmployee:
                addEmployee();
                break;
                        
            case promptMessages.removeEmployee:
                remove(delete);
                break;

            case promptMessages.updateRole:
                remove('role');
                break;
                
            case promptMessages.viewAllRoles:
                viewAllRoles();
                
            case promptMessages.exit:
                connection.end();
                break;    


        }
    });
}