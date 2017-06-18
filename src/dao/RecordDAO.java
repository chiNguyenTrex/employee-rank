package dao;

import java.util.List;

import entities.Record;

public interface RecordDAO {
	public List<Record> getRecordList();
	public List<Record> getRecordByStaff(String id);
	public void addRecord(Record record);
	public void deleteRecord(String id);
}
