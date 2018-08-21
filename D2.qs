namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (x : Qubit[], y : Qubit, b : Int[]) : ()
    {
        body
        {
            // Full function evaluates to f(x) = 1 - bk - xk % 2
            // This results in simply applying a CNOT for each qubit in x,
            //      and then flipping the value of y if 1 - bk = 1 (bk = 0)
            let length = Length(x);

            for(index in 0..length-1){
                CNOT(x[index], y);
                if(b[index] == 0){
                    X(y);
                }
            }
        }
    }
}