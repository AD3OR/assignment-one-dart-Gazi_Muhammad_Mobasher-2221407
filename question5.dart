// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐
// TODO: Complete the following requirements:

// 1. Mixin Payable:
//    - Method: double calculateSalary(double baseSalary, double bonus)
//    - Method: void processPayment(double amount)
mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    // TODO: Calculate total salary (base + bonus)
    double totalSalary = baseSalary + bonus;
    return totalSalary;
    // Placeholder - replace with actual implementation
  }
  
  void processPayment(double amount) {
    // TODO: Process payment
    print("Processing payment of \$${amount.toStringAsFixed(2)}");
    // Add your implementation here
  }
}

// 2. Mixin Reportable:
//    - Method: String generateReport(String employeeName, String department)
mixin Reportable {
  String generateReport(String employeeName, String department) {
    // TODO: Generate report
    final report = "Monthly report for $employeeName in $department department.";
    return report; // Placeholder - replace with actual implementation
  }
}

// 3. Abstract Class Employee:
//    - Properties: String name, String id, String department
//    - Abstract method: String getJobTitle()
//    - Abstract method: double getBaseSalary()
abstract class Employee {
  String name;
  String id;
  String department;
  
  Employee(this.name, this.id, this.department);
  
  String getJobTitle();
  double getBaseSalary();
  
  void displayInfo() {
    print("$name (ID: $id, Department: $department)");
    print("Job Title: ${getJobTitle()}");
    print("Base Salary: ${getBaseSalary()}");
  }
}

// 4. Concrete Classes:
//    - Manager extends Employee with Payable and Reportable
//      - Additional property: int teamSize
//      - Override required methods
class Manager extends Employee with Payable, Reportable {
  int teamSize;
  
  Manager(String name, String id, String department, this.teamSize) : super(name, id, department);
  
  @override
  String getJobTitle() {
    // Manager job title
    return "Manager";
  }
  
  @override
  double getBaseSalary() {
    // Example base salary for a manager
    return 8000.0;
  }
  
  @override
  void displayInfo() {
    // Show common employee info first
    super.displayInfo();
    print("Team Size: $teamSize");
    // Example: generate a short report summary when displaying manager info
    final report = generateReport(name, department);
    print("Report Summary: $report");
  }
}

//    - Developer extends Employee with Payable
//      - Additional property: String programmingLanguage
//      - Override required methods
class Developer extends Employee with Payable {
  String programmingLanguage;
  
  Developer(String name, String id, String department, this.programmingLanguage) : super(name, id, department);
  
  @override
  String getJobTitle() {
    return "Senior Developer";
  }
  
  @override
  double getBaseSalary() {
    // Example base salary for a developer
    return 6000.0;
  }
  
  @override
  void displayInfo() {
    super.displayInfo();
    print("Programming Language: $programmingLanguage");
  }
}

void main() {
  // 5. Create employees and demonstrate:
  //    - Salary calculation with bonus
  //    - Payment processing
  //    - Report generation (for managers)
  //    - Display all employee information
  
  // Create a manager and a developer
  final manager = Manager('Alice Johnson', 'M001', 'Engineering', 5);
  final dev = Developer('Bob Smith', 'D001', 'Engineering', 'Dart');

  // Demonstrate salary calculation with a bonus
  final managerBase = manager.getBaseSalary();
  final managerBonus = 10000.0; // example bonus
  final managerTotal = manager.calculateSalary(managerBase, managerBonus);
  print('${manager.name} total salary (with bonus): \$${managerTotal.toStringAsFixed(2)}');

  final devBase = dev.getBaseSalary();
  final devBonus = 5000.0; // example bonus
  final devTotal = dev.calculateSalary(devBase, devBonus);
  print('${dev.name} total salary (with bonus): \$${devTotal.toStringAsFixed(2)}');

  // Process payments (simulate paying base+bonus)
  manager.processPayment(managerTotal);
  dev.processPayment(devTotal);

  // Generate a report for the manager
  final managerReport = manager.generateReport(manager.name, manager.department);
  print('\nGenerated Report:\n$managerReport\n');

  // Display information for all employees
  print('\n--- Employee Information ---');
  final employees = <Employee>[manager, dev];
  for (final e in employees) {
    e.displayInfo();
    print('');
  }
  
}
