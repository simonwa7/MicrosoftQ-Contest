namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Int[]
    {
        body
        {
            mutable b = new Int[N];

            using(qubits = Qubit[N+1]){
               
                X(qubits[N]);
                for(index in 0..N){
                    H(qubits[index]);
                }

                Uf(qubits[0..N-1], qubits[N]);

                for(index in 0..N-1){
                    H(qubits[index]);
                }

                for(index in 0..N-1){
                    let bit = M(qubits[index]);
                    if(bit == One){
                        set b[index] = 1;
                    }
                }

                ResetAll(qubits);
            }

            return b;
        }
    }
}