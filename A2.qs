namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[], bits : Bool[]) : ()
    {
        body
        {
            // Keep track of the last qubit with the bit flip and apply the
            // Hadamard gate to the first qubit since the first bool is 
            // guaranteed to be true.
            mutable last = 0;
            H(qs[0]);

            // Loop through the boolean array looking for true values.
            for(index in 1..Length(bits)-1){
                if(bits[index]){
                    // If true, apply the CNOT gate with the control as the
                    // last qubit that was flipped and the target as the 
                    // qubit corresponding to the index of the true value.
                    CNOT(qs[last], qs[index]);
                    set last = index;
                }
            }
        }
    }
}