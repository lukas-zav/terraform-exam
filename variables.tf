/*
Define the variable that receives the decoded JSON from example/inputs.json.
Review inputs.json carefully and create a matching type constraint.

Hints:
  - The top-level structure is an object with four keys.
  - The instances value is a map of objects — each object represents one instance.
  - Not all instances have the same keys — look into optional() for this.
*/

variable "config" {
  description = "Decoded content of inputs.json"
  type        = any # TODO: replace with proper type
}
