def vae(Y,loss=('gaussian','negbinom'),latent_dims=(10,50),hidden_layer_width=500,nbshape=1):
    """
    Y a count matrix with cells in the rows and genes in the columns
    loss: the loss function for the model fitting
    latent_dims: number of latent dimensions
    hidden_layer_width: number of nodes in the intermediate layer
    nbshape: if loss is negbinom, what is the shape parameter
    """
    pass #insert code here
    #output:
    #latent variable coordinates: z_mean
    #note: z_mean is a keras object
    #to get encoding use Model(x,z_mean).predict(x_new)
