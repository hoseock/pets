package com.sc.pet.board.command;

public class Command {
	private String BOARD_TITLE;
	private String BORDE_CONTENT;
	private String BOARD_ID;
	public String getBOARD_TITLE() {
		return BOARD_TITLE;
	}
	public void setBOARD_TITLE(String bOARD_TITLE) {
		BOARD_TITLE = bOARD_TITLE;
	}
	public String getBORDE_CONTENT() {
		return BORDE_CONTENT;
	}
	public void setBORDE_CONTENT(String bORDE_CONTENT) {
		BORDE_CONTENT = bORDE_CONTENT;
	}
	public String getBOARD_ID() {
		return BOARD_ID;
	}
	public void setBOARD_ID(String bOARD_ID) {
		BOARD_ID = bOARD_ID;
	}
}