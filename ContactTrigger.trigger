// Toda vez que inserimos um contato novo, enviar um Email de aviso informando o mesmo
trigger ContactTrigger on Contact (after insert) {



if(Trigger.isInsert && Trigger.isAfter) {
   for(Contact buscaContato: Trigger.New){ 
    Messaging.SingleEmailMessage email = new messaging.SingleEmailMessage(); //classe Padrão para envio 
    String[] enviaEmail = new String[]{'diegosouza.97@outlook.com'}; // Guarda quem vai enviar
    email.SaveAsActivity = false; // Não quero salvar como atividade com
    email.setTargetObjectId(UserInfo.getUserId());   // Mostrar quem vai enviar o Email e pegar o usuário
    email.setToAddresses(enviaEmail);// defnindo para quem vai enviar o email    
    email.setSubject('Novo contato');//Assunto do E-mail 
    email.setPlainTextBody('Foi criado o contato com o seguinte nome:'+ buscaContato.FirstName+ 
    'Sobrenome'+buscaContato.LastName+'ID'+buscaContato.id);//Corpo do Email
    Messaging.sendEmail( new Messaging.SingleEmailMessage[] {email} );
}
}
}