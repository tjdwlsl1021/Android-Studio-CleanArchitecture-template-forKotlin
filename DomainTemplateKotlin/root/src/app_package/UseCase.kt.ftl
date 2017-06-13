package ${packageName}

import javax.inject.Inject

<#if existInput && existOutput>
<#if applicationPackage??>
import ${applicationPackage}.utils.commons.ExecutionThreads
import ${applicationPackage}.utils.commons.IoUseCase
import ${applicationPackage}.utils.commons.UseCase
</#if>
class ${useCaseName} @Inject constructor(executionThreads: ExecutionThreads)
    : IoUseCase<${useCaseName}.${useCaseName}Request, ${useCaseName}.${useCaseName}Response>(executionThreads) {

    data class ${useCaseName}Request(/* add input data */): UseCase.RequestValue
    data class ${useCaseName}Response(/* add output data */): UseCase.ResponseValue
}
<#elseif !existInput && existOutput>
<#if applicationPackage??>
import ${applicationPackage}.utils.commons.ExecutionThreads
import ${applicationPackage}.utils.commons.OutputOnlyUseCase
import ${applicationPackage}.utils.commons.UseCase
</#if>
class ${useCaseName} @Inject constructor(executionThreads: ExecutionThreads)
    : OutputOnlyUseCase<${useCaseName}.${useCaseName}Response>(executionThreads) {

    data class ${useCaseName}Response(/* add output data */): UseCase.ResponseValue
}
<#elseif existInput && !existOutput>
<#if applicationPackage??>
import ${applicationPackage}.utils.commons.ExecutionThreads
import ${applicationPackage}.utils.commons.InputOnlyUseCase
import ${applicationPackage}.utils.commons.UseCase
</#if>
class ${useCaseName} @Inject constructor(executionThreads: ExecutionThreads)
    : InputOnlyUseCase<${useCaseName}.${useCaseName}Request>(executionThreads) {

    data class ${useCaseName}Request(/* add input data */): UseCase.RequestValue
}
<#else>
<#if applicationPackage??>
import ${applicationPackage}.utils.commons.ExecutionThreads
import ${applicationPackage}.utils.commons.SimpleUseCase
</#if>
class ${useCaseName} @Inject constructor(executionThreads: ExecutionThreads)
    : SimpleUseCase(executionThreads) {

}
</#if>