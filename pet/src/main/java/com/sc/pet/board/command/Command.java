package com.sc.pet.board.command;

public class Command {
	private String BOARD_TITLE;
	private String BOARD_CONTENTS;
	private String BOARD_ID;

	public String getBOARD_TITLE() {
		return BOARD_TITLE;
	}
	public void setBOARD_TITLE(String bOARD_TITLE) {
		BOARD_TITLE = bOARD_TITLE;
	}
	public String getBOARD_CONTENTS() {
		return BOARD_CONTENTS;
	}
	public void setBOARD_CONTENTS(String bOARD_CONTENTS) {
		BOARD_CONTENTS = bOARD_CONTENTS;
	}
	public String getBOARD_ID() {
		return BOARD_ID;
	}
	public void setBOARD_ID(String bOARD_ID) {
		BOARD_ID = bOARD_ID;
	}
}