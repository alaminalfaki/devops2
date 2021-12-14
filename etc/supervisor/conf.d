---
- hosts:  servers
  become: true
  vars:
    project_location: /srv/long_running_python_process
    program_name: long_running_process

  tasks:

    - name: install supervisor program
      supervisor_state: started
      supervisor_reboot: yes
     
    - name: restart supervisord
      service: name=supervisord state=restarted

    - name: "supervisorctl restart {{program_name}}"
      command: "supervisorctl restart {{program_name}}"
      
   
