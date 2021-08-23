import model.Diretor;
import model.Funcionario;
import repository.DiretorRepository;
import repository.FuncionarioRepository;
import service.DiretorService;
import service.FuncionarioService;

import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        Funcionario funcionario = new Funcionario(12,"Raul","90876764839",1000.0);
//
//        FuncionarioService service = new FuncionarioService();
//
//        service.save(funcionario);
//
//        funcionario.setNome(funcionario.getNome() + " - alterado");
//
//        service.update(funcionario);
//
//        FuncionarioRepository repository = new FuncionarioRepository();



        Diretor diretor = new Diretor(1,"Gabriel","98784678376",2000.00,5);

        DiretorService service = new DiretorService();

        service.save(diretor);

        diretor.setNome(diretor.getNome() + " - alterado");

        service.update(diretor);

        DiretorRepository repository = new DiretorRepository();

        repository.findAll();

        repository.findById(1);
    }
}
