namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            for(index in 0..Length(qs)-2){
                CNOT(qs[index], qs[index+1]);
            }

            if(M(qs[Length(qs)-1]) == One){
                return 1;
            }
            return 0;
        }
    }
}