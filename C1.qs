namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (q : Qubit) : Int
    {
        body
        {
            let angle = 0.25*3.14159;
            Ry(angle, q);
            if(M(q) == Zero){
                return 0;
            }
            return 1;
        }
    }
}