// Import the library for creating namespaces
local namespaceLib = import '../modules/namespace.jsonnet';

// Define the namespaces for the platform services
[
  // Create the 'nginx' namespace
  namespaceLib.Namespace('nginx'),
  // Create the 'kyverno' namespace
  namespaceLib.Namespace('kyverno'),
  // Additional platform resources like role bindings, applications, etc., can be added here
  // Example: Uncomment and adjust the following line to add a role using a hypothetical roleLib
  // roleLib.Role('nginx-admin', 'nginx', {/* Role definition here */}),
]
