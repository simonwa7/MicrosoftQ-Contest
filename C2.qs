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
            // Randomize the basis for measurement
            let basis = RandomInt(2);

            if(basis == 0){
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

            // Tried to use a qubit to randomize basis measurement, but 
            //      created a runtime issue. Would like to figure this out
            // using(ancilla = Qubit[1]){
            //     let basis = ancilla[0];
            //     H(basis);
            //     if(M(basis) == Zero){
            //         if(M(q) == One){
            //             set answer = 1;
            //         }else{
            //             set answer = -1;
            //         }
            //     }else{
            //         H(q);
            //         if(M(q) == One){
            //             set answer = 0;
            //         }else{
            //             set answer = -1;
            //         }
            //     }
            // }

            return answer;
        }
    }
}