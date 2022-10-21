package member;

public class memberDTO {
	private String userId, userValue,userName,userMessege;

	public String getUserId() {
		return userId;
	}

	public String getUserMessege() {
		return userMessege;
	}

	public void setUserMessege(String userMessege) {
		this.userMessege = userMessege;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserValue() {
		return userValue;
	}

	public void setUserValue(String userValue) {
		this.userValue = userValue;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}