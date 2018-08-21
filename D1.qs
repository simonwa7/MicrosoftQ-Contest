namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (x : Qubit[], y : Qubit, b : Int[]) : ()
    {
        body
        {
            let length = Length(x);

            for(index in 0..length-1){
                if(b[index] == 1){
                    CNOT(x[index], y);
                }
            }
        }
    }
}