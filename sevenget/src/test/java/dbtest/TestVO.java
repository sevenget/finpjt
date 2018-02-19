package dbtest;

public class TestVO {
	int id;
	String name;
	
	TestVO(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return id+name;
	}
	
	
}
