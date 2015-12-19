namespace Microsoft.Pc
{
    public class CommandLineOptions
    {
        public bool analyzeOnly;
        public LivenessOption liveness;
        public string outputDir;
        public bool outputFormula;
        public bool erase;
        public bool shortFileNames;
        public bool printTypeInference;

        public CommandLineOptions()
        {
            this.analyzeOnly = false;
            this.liveness = LivenessOption.None;
            this.outputDir = null;
            this.outputFormula = false;
            this.erase = true;
            this.shortFileNames = false;
            this.printTypeInference = false;
        }
    }
}