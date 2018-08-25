//
//  CategoriesTableViewController.swift
//  AcaoNit
//
//  Created by Victor Mendes on 25/08/18.
//  Copyright © 2018 Victor Mendes. All rights reserved.
//

import UIKit
import Moya

class CategoriesTableViewController: UITableViewController {

    var model: [CategoryModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = mock()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        RequestCategories()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let m = model else { return 0 }
        return m.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let m = model else { return UITableViewCell() }
        cell.textLabel?.text = m[indexPath.row].title
        return cell
    }
    
    // MARK: - Navigation
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? SubTableViewController
        if segue.identifier == "segueSubCell" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selected = model![indexPath.row].details
                destination?.model = selected
            }
        }
    }
    
}

// MARK: - Request

//extension CategoriesTableViewController {
//    
//    func RequestCategories() {
//        let provider = MoyaProvider<Requests>()
//        provider.request(.categories) { (result) in
//            switch result {
//            case .success(let response):
//                let decoder = JSONDecoder()
//                do {
//                    let decode = try decoder.decode([CategoryModel].self, from: response.data)
//                    self.model = decode
//                    self.tableView.reloadData()
//                    
//                } catch let fail {
//                    print(fail)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//    
//}

extension CategoriesTableViewController {
    
    func mock() -> [CategoryModel] {
        let description = """
        DESCRIÇÃO:A Campanha começou em março de 2012, de início era realizada na praça Getúlio Vargas na praia de Icaraí próxima a reitoria da UFF, logo depois se estendeu para o bairro de São Francisco, passando também por Piratininga, sempre todos os meses com duas edições.
        Em 2013 a Campanha saiu da praça Getúlio Vargas e foi para o Campo de São Bento, em outubro do mesmo ano foi realizada a primeira campanha de adoção no MAC (Museu de Arte Contemporânea), sendo um marco para a história da campanha nossa presença em uma obra do mestre Oscar Niemeyer.
        Em 2014 um outro momento marcante e emocionante na história da “Adotar é o Bicho!”, foi a realização da primeira campanha de adoção no Horto do Fonseca,  foi especial pelo motivo de todos os animais participantes, nesse caso gatos e gatas, terem sido resgatados no local e colocados para adoção, saldo desse dia foi de 11 felinos que ganharam novos lares.
        Todo mês a campanha marca presença no Campo de São Bento em Icaraí, em dois encontros no segundo domingo e no último domingo de cada mês, das 10h às 14h.
        A Campanha é realizada por protetores independentes e ONG´s de proteção animal da cidade de Niterói/RJ.
        Desde março de 2012 fazendo a diferença pelos animais.
        Por que ADOTAR ... é o Bicho!
        """
        let caseDetailOne = DetailModel(id: 1,
                                        title: "Campanha de adoção Adotar é o bicho!",
                                        subTitle: "Campanha de adoção de cães e gatos",
                                        date: "Todo Segundo domingo de cada mês",
                                        hour: "10:00 às 14:00",
                                        place: "Campo de São Bento – Icarai",
                                        description: description,
                                        organizer: "Secretaria de Meio Ambiente e Coordenadoria Especial de Direito dos Animais (CEDA)",
                                        phone: "XXXXXX",
                                        socialMedia: "Mais informações no site da campanha www.adotareobicho.com.br ou no instagram @adotareobichonit",
                                        tags: "cão, animal, pets, adoção, secretária do meio ambiente")
        let caseModelOne = CategoryModel(id: 1, title: "Meio ambiente",
                                         details: [caseDetailOne])
        
        return [caseModelOne]
    }
    
}
