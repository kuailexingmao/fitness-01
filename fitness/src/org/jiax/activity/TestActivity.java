package org.jiax.activity;

import java.util.List;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.repository.DeploymentQuery;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.junit.Test;


public class TestActivity {

	@Test
	public void Test1(){
		ProcessEngineConfiguration pec = 
				ProcessEngineConfiguration.createStandaloneProcessEngineConfiguration();
		pec.setJdbcDriver("com.mysql.jdbc.Driver");
		pec.setJdbcUrl("jdbc:mysql://localhost:3306/fitness?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true");
		pec.setJdbcUsername("root");
		pec.setJdbcPassword("root");
		pec.setDatabaseSchemaUpdate("true");
		ProcessEngine buildProcessEngine = pec.buildProcessEngine();
	}
	
	ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
	
	@Test
	public void test2(){
		DeploymentBuilder createDeployment = processEngine.getRepositoryService().createDeployment();
		createDeployment.addClasspathResource("qjlc.bpmn");
		createDeployment.addClasspathResource("qjlc.png");
		Deployment deploy = createDeployment.deploy();
		System.out.println(deploy.getId());
	}
	
	@Test
	public void test3(){
		ProcessDefinitionQuery query = processEngine.getRepositoryService().createProcessDefinitionQuery();
		query.processDefinitionKey("qjlc");
		query.orderByProcessDefinitionVersion().desc();
		query.listPage(0, 1);
		List<ProcessDefinition> list = query.list();
		for (ProcessDefinition deployment : list) {
			System.out.println("结果为"+deployment.getId()+"/"+deployment.getName()+"/"+deployment.getVersion());
		}
	}
	
	@Test
	public void test4(){
		String processId = "qjlc:2:104";
		ProcessInstance byId = processEngine.getRuntimeService().startProcessInstanceById(processId);
		System.out.println(byId.getId());
	}
	
	@Test
	public void test5(){
		TaskQuery query = processEngine.getTaskService().createTaskQuery();
		query.taskAssignee("张三");
		List<Task> list = query.list();
		for (Task task : list) {
			System.out.println("结果："+task.getId()+"/"+task.getName()+"/"+task.getAssignee());
		}
	}
	
	@Test
	public void test6(){
		String taskId = "302";
		processEngine.getTaskService().complete(taskId);
	}
}
