namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : ()
    {
        body
        {
            // Keep track of the last qubit with the bit flip and apply the
            // Hadamard gate to the first qubit since the first bool is 
            // guaranteed to be true.
            mutable last = -1;

            // Loop through the boolean array looking for true values.
            for(index in 0..Length(bits0)-1)
            {
                if(bits0[index] || bits1[index])
                {
                    if(bits0[index] == bits1[index])
                    {
                        X(qs[index]);
                    }else{
                        if(last == -1)
                        {
                            H(qs[index]);
                            set last = index;
                        }else{
                            if(bits0[index] != bits1[index])
                            {
                                CNOT(qs[last], qs[index]);
                                if(bits0[index] != bits0[last])
                                {
                                    X(qs[index]);
                                }
                                set last = index;
                            }
                        }
                    }
                }
            }
        }
    }
}