package edu.fyp.repository;

import java.util.Date;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;

import org.springframework.stereotype.Repository;

import com.google.appengine.api.datastore.Key;

import edu.fyp.bean.node.ApproveNode;
import edu.fyp.bean.node.NoticeNode;
import edu.fyp.bean.node.PathNode;
import edu.fyp.bean.node.StartNode;

@Repository
public class PathNodeRepository {
	public void addPathNode(PathNode pathNode){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			pm.makePersistent(pathNode);
		} finally {
			pm.close();
		}
	}
	public PathNode getNode(Key key){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		PathNode pathNode=null;
	    try {
	    	String classKind = key.getKind();
	    	pathNode = (PathNode) pm.getObjectById(Class.forName("edu.fyp.bean.node."+classKind), key);
	    }catch(Exception e){
	    	
	    } finally {
	        pm.close();
	    } 
	    return pathNode;
	}
	
	public void updateStartNextNode(StartNode startNode, Key nextNodeKey){
		PersistenceManager pm = PMF.get().getPersistenceManager();
	    try {
	    	StartNode sn = pm.getObjectById(StartNode.class, startNode.getNodeKey());
	        sn.setNextNode(nextNodeKey);
	    } finally {
	        pm.close();
	    }
	}
	
	public void updateNodeState(PathNode pathNode,String state){
		PersistenceManager pm = PMF.get().getPersistenceManager();
	    try {
	    	String classKind = pathNode.getNodeKey().getKind();
	    	PathNode pn = (PathNode) pm.getObjectById(Class.forName("edu.fyp.bean.node."+classKind), pathNode.getNodeKey());
	    	pn.setState(state);
	    }catch(Exception E){
	    	Logger.getAnonymousLogger().warning(E.toString());
	    }	    finally {
	        pm.close();
	    }
	}
	
	public void updateNodeApproveID(ApproveNode pathNode, String approveID){
		PersistenceManager pm = PMF.get().getPersistenceManager();
	    try {
	    	String classKind = pathNode.getNodeKey().getKind();
	    	ApproveNode an = (ApproveNode) pm.getObjectById(ApproveNode.class, pathNode.getNodeKey());
	    	an.setApproverID(approveID);
	    }catch(Exception E){
	    	Logger.getAnonymousLogger().warning(E.toString());
	    }	    finally {
	        pm.close();
	    }
	}
		
	public void updateNodeDate(PathNode pathNode){
		PersistenceManager pm = PMF.get().getPersistenceManager();
	    try {
	    	String classKind = pathNode.getNodeKey().getKind();
	    	PathNode pn = (PathNode) pm.getObjectById(Class.forName("edu.fyp.bean.node."+classKind), pathNode.getNodeKey());
	    	pn.setProcessDate(new Date());
	    }catch(Exception E){
	    	Logger.getAnonymousLogger().warning(E.toString());
	    }	    finally {
	        pm.close();
	    }
	}
	
	public void updateNoticeNextNode(NoticeNode noticeNode, Key nextNodeKey){
		PersistenceManager pm = PMF.get().getPersistenceManager();
	    try {
	    	NoticeNode nn = pm.getObjectById(NoticeNode.class, noticeNode.getNodeKey());
	        nn.setNextNode(nextNodeKey);
	    } finally {
	        pm.close();
	    }
	}
	
	public void updateApproveNextNode(ApproveNode approveNode, Key nextNodeKey){
		PersistenceManager pm = PMF.get().getPersistenceManager();
	    try {
	    	ApproveNode an = pm.getObjectById(ApproveNode.class, approveNode.getNodeKey());
	        an.setNextNode(nextNodeKey);
	    } finally {
	        pm.close();
	    }
	}
	
	public void updateApproveNextTrueNode(ApproveNode approveNode, Key nextNodeKey){
		PersistenceManager pm = PMF.get().getPersistenceManager();
	    try {
	    	ApproveNode an = pm.getObjectById(ApproveNode.class, approveNode.getNodeKey());
	        an.setNextTrueNode(nextNodeKey);
	    } finally {
	        pm.close();
	    }
	}
	
	public void updateApproveNextFalseNode(ApproveNode approveNode, Key nextNodeKey){
		PersistenceManager pm = PMF.get().getPersistenceManager();
	    try {
	    	ApproveNode an = pm.getObjectById(ApproveNode.class, approveNode.getNodeKey());
	        an.setNextFalseNode(nextNodeKey);
	    } finally {
	        pm.close();
	    }
	}
	public void reassignApproveNode(PathNode pathNode,String empID){
		PersistenceManager pm = PMF.get().getPersistenceManager();
	    try {
	    	String classKind = pathNode.getNodeKey().getKind();
	    	ApproveNode an = (ApproveNode) pm.getObjectById(Class.forName("edu.fyp.bean.node."+classKind), pathNode.getNodeKey());
	    	an.setEmpID(empID);
	    	an.setDeptID(null);
	    	an.setApproverID(null);
	    	an.setSuperLevel(0);
	    	an.setType("spec");
	    }catch(Exception E){
	    	Logger.getAnonymousLogger().warning(E.toString());
	    }	    finally {
	        pm.close();
	    }
	}
}
