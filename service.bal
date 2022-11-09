import ballerina/http;


public type PolicyEntry record {|
    readonly string policyId;
    string address;
    string status;
|};

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    #
    # + policyId - Parameter Description
    # + return - string name with hello message or error
    resource function get policies/[string policyId]() returns PolicyEntry|error {
        return {policyId: policyId, address: "Eugene Carriere, 30", status: "Processing"};
    }

    resource function post policies (@http:Payload PolicyEntry policy) returns http:BadRequest|http:Created|error {
        return http:CREATED;
    }
}
