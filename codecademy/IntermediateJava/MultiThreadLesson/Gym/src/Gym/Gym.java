package Gym;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class Gym {
	private final int totalGymMembers;
	
	private Map<MachineType, Integer> availableMachine;
	
	public Gym(int totalGymMembers, Map<MachineType, Integer> availableMachine) {
		this.totalGymMembers = totalGymMembers;
		this.availableMachine = availableMachine;
	}
	
	public void openForTheDay() {
		List<Thread> gymMembersRoutines;
		gymMembersRoutines = IntStream.rangeClosed(1, this.totalGymMembers).mapToObj(
				(id) -> {
					Member member = new Member(id);
					return new Thread(() -> {
						try {
							member.performRoutine();
						} catch (Exception e) {
							System.out.println(e);
						}
					});
				}).collect(Collectors.toList());
		
		Thread supervisor = createSupervisor(gymMembersRoutines);
		
		gymMembersRoutines.forEach( (t) -> t.start());
		//gymMembersRoutines.forEach(Thread::start);
		supervisor.start();
	}
	
	private Thread createSupervisor(List<Thread> threads) {
		Thread supervisor = new Thread(() -> {
			while (true) {
				//List<String> runningThreads = threads.stream().filter(Thread::isAlive).map(Thread::getName).collect(Collectors.toList());
				List<String> runningThreads = threads.stream().filter((t) -> t.isAlive()).map((t) -> t.getName()).collect(Collectors.toList());
				System.out.println(Thread.currentThread().getName() + " - " + runningThreads.size() + " members currently exercising: " + runningThreads + "\n");
				
				if(runningThreads.size()<=0) break;
				
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					System.out.println(e);
				}
			}
			
			System.out.println(Thread.currentThread().getName() + " - All members are finished exercising!");
		});
		supervisor.setName("Gym Staff");
		return supervisor;
	}
	
	public static void main(String[] args) {
		Gym myGym = new Gym(5, new HashMap<>() {
			{
				put(MachineType.BARBELL,1);
				put(MachineType.CABLECROSSOVERMACHINE, 2);
				put(MachineType.LATPULLDOWNMACHINE, 3);
				put(MachineType.SQUATMACHINE, 4);
				put(MachineType.LEGEXTENSIONMACHINE, 6);
			}
		});
		myGym.openForTheDay();
	}
}
