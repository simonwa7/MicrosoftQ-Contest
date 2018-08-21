namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Convert;
    open Microsoft.Quantum.Extensions.Math;

    operation Solve (q : Qubit) : Int
    {
        body
        {
            mutable answer = -1;
            
            // Using a qubit to randomize basis for measurement
            using(ancilla = Qubit[1]){

                // Randomize the basis for measurement
                let basis = ancilla[0];
                H(basis);
                if(M(basis) == Zero){
                // Measuring in the normal basis
                    if(M(q) == One){
                    // This can only happen if we had the + state
                        set answer = 1;
                    }else{
                    // Otherwise we cannot know for sure
                        set answer = -1;
                    }
                }else{
                // Measuring in the Hadamard basis
                    H(q);
                    if(M(q) == One){
                    // This can only happen if we were in the 
                    //      0 state initially (+ -> 0, 0 -> +)
                        set answer = 0;
                    }else{
                    // Otherwise we cannot know for sure
                        set answer = -1;
                    }
                }
                ResetAll(ancilla);
            }

            return answer;
        }
    }
}