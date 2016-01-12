event UpdateArtifactManager;
event ArtifactManagerGoalAchieved;

module NodeService 
{
	machine ArtifactManager {

	    var GoalReceiverV : machine;
	    var GoalAchievedReplyToV : seq[machine];

	    start state Initialize {
	        on UpdateArtifactManager goto Reconciling with
	        {
	            assert (GoalReceiverV == null);
				assert (GoalReceiverV == GoalAchievedReplyToV[0]);
	        };
	    }

	    state Reconciling {
	        on ArtifactManagerGoalAchieved goto GoalAchieved with 
	        
	        {
	            var replyToArray : seq[machine];
	            // DELETE next line to suppress compilation error
	            replyToArray = GoalAchievedReplyToV;
	        };
	    }

	    state GoalAchieved {

	    }

	}
}


