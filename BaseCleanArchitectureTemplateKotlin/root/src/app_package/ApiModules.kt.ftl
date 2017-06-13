package ${packageName}

import dagger.Module
<#if includeRetrofit>
import dagger.Provides
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.converter.gson.GsonConverterFactory
</#if>

/* module for API connection(e.g retrofit2, http3, etc..) */
@Module
class ApiModules {
<#if includeRetrofit>
    @Provides fun provideOkHttpClientBuilder():OkHttpClient.Builder {
        val interceptor = HttpLoggingInterceptor()
        interceptor.level = HttpLoggingInterceptor.Level.BODY
        return OkHttpClient.Builder().addInterceptor(interceptor)
    }

    private fun createRetrofitBuilder(endPoint: String):Retrofit.Builder =
            Retrofit.Builder()
                    .baseUrl(endPoint)
                    .addConverterFactory(GsonConverterFactory.create())
                    .addCallAdapterFactory(RxJava2CallAdapterFactory.create())

    @Provides fun provideRetrofitBuilder(): Retrofit.Builder {
        return createRetrofitBuilder("http://localhost/some/api")
    }

<#if useSwagger>

private fun createApiClient(retrofitBuilder:Retrofit.Builder,
                            builder: OkHttpClient.Builder): ApiClient {
    val client = ApiClient()
    client.setAdapterBuilder(retrofitBuilder)
    client.configureFromOkclient(builder.build())
    return client
}

@Provides fun provideApiClient(retrofitBuilder:Retrofit.Builder,
                            builder: OkHttpClient.Builder): ApiClient {
    return createApiClient(retrofitBuilder, builder)
}

    /*FIXME if you add some Swagger ApiService, add provide method. Like this */
    // @Provides fun provideSomeApi(client: ApiClient): SomeApiService {
    //    return client.createService(SomeApiService::class.java)
    // }


<#else>
private fun <S> createService(serviceClass: Class<S>, retrofitBuilder:Retrofit.Builder, okHttpClientBuilder:OkHttpClient.Builder ): S {
    return retrofitBuilder.client(okHttpClientBuilder.build()).build().create(serviceClass)
}

    /*FIXME if you add some RetrofitService, add provide method. Like this */
    //  @Provides fun provideSomeApiService(retrofitBuilder:Retrofit.Builder, builder: OkHttpClient.Builder):SomeApiService {
    //      createService(SomeApiService::class.java,retrofitBuilder, builder)
    //  }
</#if>

</#if>
}
