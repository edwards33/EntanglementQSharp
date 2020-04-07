namespace Quantum.Superposition
{
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    
    operation Superposition () : Result {
        mutable state = Zero;
        using (qubit = Qubit()){
            H(qubit);
            set state = M(qubit);

            Reset(qubit);
		}

        return state;
    }
}
