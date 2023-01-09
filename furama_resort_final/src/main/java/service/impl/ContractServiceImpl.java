package service.impl;

import model.Contract;
import repository.IContractRepository;
import repository.impl.ContractRepositoryImpl;
import service.IContractService;

import java.util.List;

public class ContractServiceImpl implements IContractService {
    private final IContractRepository contractRepository = new ContractRepositoryImpl();
    @Override
    public List<Contract> selectAllContract() {
        return this.contractRepository.selectAllContract();
    }
}
