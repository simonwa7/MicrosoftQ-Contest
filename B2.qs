namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            mutable numOnes = 0;

            for(index in 0..Length(qs)-1){
                if(M(qs[index]) == One){
                    set numOnes = numOnes + 1;
                }
            }

            if(numOnes == 1){
                return 1;
            }
            return 0;
        }
    }
}