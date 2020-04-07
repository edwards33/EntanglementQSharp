namespace Quantum.Entanglement
{
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    
    operation Entanglement () : (Result, Result) {
        mutable qubitState01 = Zero;
        mutable qubitState02 = Zero;
        using ((qubit01, qubit02) = (Qubit(), Qubit())) {
            H(qubit01);
            CNOT(qubit01, qubit02);

            set qubitState01 = M(qubit01);
            set qubitState02 = M(qubit02);

            Reset(qubit01);
            Reset(qubit02);
		}

        return (qubitState01, qubitState02);
    }
}
