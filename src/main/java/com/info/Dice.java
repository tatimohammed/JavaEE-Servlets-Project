package com.info;

public class Dice {
	
	private String diceNum;
	
	private int diceRes;
	

	public Dice(String diceNum, int diceRes) {
		this.diceNum = diceNum;
		this.diceRes = diceRes;
	}

	public String getDiceNum() {
		return diceNum;
	}

	public void setDiceNum(String diceNum) {
		this.diceNum = diceNum;
	}

	public int getDiceRes() {
		return diceRes;
	}

	public void setDiceRes(int diceRes) {
		this.diceRes = diceRes;
	}
	
	
	
}
